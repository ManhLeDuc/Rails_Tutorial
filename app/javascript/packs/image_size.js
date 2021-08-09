$(function () {
  $('#micropost_image').on('change', function () {
    var size_in_megabytes = this.files[0].size / 1024 / 1024;
    var message = $('#data_passing').attr('info_1');
    var max = parseInt($('#data_passing').attr('max'));
    message += max;
    message += 'MB. ';
    message += $('#data_passing').attr('info_2');
    if (size_in_megabytes > max) {
      alert(message);
    }
  });
});
