$(function () {
  window.webrtc = new SimpleWebRTC({
    // the id/element dom element that will hold "our" video
    localVideoEl: 'localVideo',
    // the id/element dom element that will hold remote videos
    remoteVideosEl: 'remoteVideos',
    // immediately ask for camera access
    autoRequestMedia: true,

  });


  // we have to wait until it's ready
  webrtc.on('readyToCall', function () {
    // you can name it anything
    webrtc.joinRoom('chris room ');
  });

  $('#pause-button').on('click', function(){
    if($('#pause-button').text() === 'Pause'){
      webrtc.stopLocalVideo()
      $('#pause-button').text('Play')
      $('#pause-button').removeClass('btn-danger')
      $('#pause-button').addClass('btn-success')
    } else {
      webrtc.startLocalVideo()
      $('#pause-button').text('Pause')
      $('#pause-button').removeClass('btn-success')
      $('#pause-button').addClass('btn-danger')
    }
  })
})
