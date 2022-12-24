function record --description "Record screen"
  wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -c h264_vaapi -d /dev/dri/renderD128 -F hwupload,scale_vaapi=format=nv12 $argv
end 
