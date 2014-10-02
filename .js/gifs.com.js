var lastUrl;

function addDownloadButton() {
  $('.bottom-bar .browse').after([
    '<a id="downloadbutton" class="browse" href="" download="" style="margin-left: 35px">',
      '<span>Download</span>',
    '</a>'
  ].join(''));
}

function updateDownloadUrl() {
  var url = $('#imgsrc').attr('src');
  var el;

  if (lastUrl !== url) {
    el = $('#downloadbutton');
    el.attr('href', url);
    el.attr('download', url.split('/').pop());
    lastUrl = url;
  }
}

$(function() {
  $('img.check-image').attr('id', 'imgsrc');
  addDownloadButton();
  setInterval(updateDownloadUrl, 250);
});
