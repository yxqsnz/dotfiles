function re-encode 
	ffmpeg -i $argv[1] $argv[1].reencoded.mp4 -pix_fmt yuv420p
end
