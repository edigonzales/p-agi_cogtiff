#!/usr/bin/env bash
set -euo pipefail

# Eingabe- und Ausgabe-Verzeichnisse
INPUT_DIR="/Users/stefan/tmp/dtm_2025/dtm"
OUTPUT_DIR="/Users/stefan/tmp/dtm_2025/contours"

# Output-Verzeichnis anlegen, falls nicht vorhanden
mkdir -p "$OUTPUT_DIR"

# Äquidistanz in Metern (0.5 m = 50 cm)
EQUIDIST=0.5

# alle .tif/.tiff-Dateien im Verzeichnis abarbeiten
find "$INPUT_DIR" -maxdepth 1 \( -iname '*.tif' -o -iname '*.tiff' \) -print0 \
| while IFS= read -r -d '' tif; do
    base="$(basename "$tif")"
    name="${base%.*}"
    out="${OUTPUT_DIR}/${name}_contours.gpkg"
    layer="contours"

    # Temp-Dateien für das Smoothing
    tmp_tif="${OUTPUT_DIR}/${name}_tmp.tif"
    smooth_tif="${OUTPUT_DIR}/${name}_smooth.tif"

    echo "Verarbeite: $tif"
    echo "  -> Erzeuge geglättetes DTM"

    # Ursprungs-Geotiff in tmp kopieren
    cp "$tif" "$tmp_tif"

    # 10x glätten mit cubicspline
    for i in {1..10}; do
        echo "    Smoothing-Pass $i/10"
        gdalwarp \
          -co COMPRESS=PACKBITS \
          -overwrite \
          -r cubicspline \
          "$tmp_tif" "$smooth_tif"

        # Ergebnis wieder als neue tmp-Grundlage verwenden
        cp "$smooth_tif" "$tmp_tif"
    done

    echo "  -> Erzeuge Höhenlinien aus geglättetem Raster"
    # 1) Höhenlinien erzeugen, 3D-Geometrie, Attribut 'kote'
    gdal_contour \
      -a kote \
      -3d \
      -i "$EQUIDIST" \
      -f GPKG \
      -nln "$layer" \
      "$tmp_tif" "$out"

    echo "  -> Füge Attribut 'jahr' hinzu und setze es auf 2025"

    # 2) Attribut 'jahr' hinzufügen (INTEGER)
    ogrinfo "$out" \
      -sql "ALTER TABLE $layer ADD COLUMN jahr INTEGER" \
      -dialect SQLITE >/dev/null

    # 3) Attribut 'jahr' setzen
    ogrinfo "$out" \
      -sql "UPDATE $layer SET jahr = 2025" \
      -dialect SQLITE >/dev/null

    # 4) Temp-Dateien aufräumen
    rm -f "$tmp_tif" "$smooth_tif"

    echo "Fertig: $out"
done

echo "Alle Höhenlinien liegen in $OUTPUT_DIR"
