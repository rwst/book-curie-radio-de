mkdir -p page-images
for (( i=14; i<145; i++ ))
do
	psselect -p$i curie.ps >t.ps
#	jpegtopnm $i.jpg >t.pnm 
	pstopnm -dpi=300 t.ps
	pnmcrop -margin=20 t001.ppm >t.ppm
#	pamthreshold t.ppm >t.pam
	printf -v j %03d $((i-13))
	convert t.ppm -compress group4 page-images/${j}.tif
#	convert t.pam -compress group4 page-images/${j}.tif
	tesseract page-images/${j}.tif ${j} -l deu
	echo $j
done
#mv page-images/001.tif page-images/cover.tif
#mv page-images/002.tif page-images/verso.tif
#rm -f t.ps t001.ppm t.pam
#zip 22761-page-images page-images/*
#psselect -p$i ideen.ps t.ps ; pstopnm -dpi=600 t.ps ; pnmtotiff t001.ppm >t.tiff; tesseract t.tiff $i -l deu; echo $i; done
