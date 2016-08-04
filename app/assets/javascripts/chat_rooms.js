$(function () {
  window.webrtc = new SimpleWebRTC({
    // the id/element dom element that will hold "our" video
    localVideoEl: 'localVideo',
    // the id/element dom element that will hold remote videos
    remoteVideosEl: 'remoteVideos',
    // immediately ask for camera access
    // autoRequestMedia: true,

  });


  // we have to wait until it's ready
  webrtc.on('readyToCall', function () {
    // you can name it anything
    webrtc.joinRoom('chris room ');
  });

  $('#pause-button').on('click', function(){
    if($('#pause-button').text() === 'Start A Video Call'){
      $('#remoteVideos').html('')
      webrtc.startLocalVideo()
      $('#pause-button').text('Pause')
      $('#pause-button').removeClass('btn-success')
      $('#pause-button').addClass('btn-danger')
    } else if($('#pause-button').text() === 'Pause') {
      $('#remoteVideos').html('')
      webrtc.stopLocalVideo()
      $('#pause-button').text('Play')
      $('#pause-button').removeClass('btn-danger')
      $('#pause-button').addClass('btn-success')
    } else if($('#pause-button').text() === 'Play') {
      $('#remoteVideos').html('')
      webrtc.startLocalVideo()
      $('#pause-button').text('Pause')
      $('#pause-button').removeClass('btn-success')
      $('#pause-button').addClass('btn-danger')
    }
  })
})
