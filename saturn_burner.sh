#!/bin/bash
clear
echo "================="
echo "SATURN BURNER 1.0 for FreeBSD"
echo "================="
echo ""
echo "- Introduce disco"
cdcontrol eject
echo ""
read -rp "- Pulsa "F" tras insertar disco " KEY
    if [ "$KEY" = "F" ]; then
    cdcontrol close
    else
     echo "Tecla no reconocida"
    fi
echo ""
# Leemos la ruta del directorio con los archivos .cue
echo "- Mostrando lista de directorios"
echo ""
ls "PON AQUÍ LA RUTA DE TU DIRECTORIO DE BACKUPS" | sort
echo ""
read -rp "- Indica directorio con fichero .cue: " DIR
echo ""
cd "PON AQUÍ LA RUTA DE TU DIRECTORIO DE BACKUPS""$DIR"

# Buscamos el archivo .cue
CUE=$(ls | grep .cue)

    # Mostramos al usuario el archivo .cue encontrado y confirmamos si desea grabarlo
    read -rp "¿Quieres quemar el fichero $CUE (S/N)?: " SN
    echo ""
    if [ "$SN" = "S" ]; then
        echo "- Grabando disco..."
        echo ""
        # Invocamos cdrdao
        cdrdao write --device /dev/cd0 --swap --speed 16 *.cue
        cdcontrol eject
        echo ""
        echo "Grabacion completada"
    else
        echo "No se realizó la grabación."
    fi
