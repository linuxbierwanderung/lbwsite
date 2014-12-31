all: background-1024.jpg background-1920.jpg background-3177.jpg

background-1024.jpg: background.xcf
	convert -adaptive-resize 1024x -quality 70 background.xcf background-1024.jpg
	jpegoptim background-1024.jpg

background-1920.jpg: background.xcf
	convert -adaptive-resize 1920x -quality 70 background.xcf background-1920.jpg
	jpegoptim background-1920.jpg

background-3177.jpg: background.xcf
	convert -adaptive-resize 3177x -quality 70 background.xcf background-3177.jpg
	jpegoptim background-3177.jpg

