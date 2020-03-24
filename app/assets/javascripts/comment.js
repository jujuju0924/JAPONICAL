$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                  </strong>
                  ${comment.text}
                </p>`
    return html;
  }
  $('#comment').on('submit', function(e){
  e.preventDefault();
  var formData = new FormData(this);
  var url = $(this).attr('action');
  $.ajax({
    url: url,
    type: "POST",
    data: formData,
    dataType: 'json',
    processData: false,
    contentType: false
  })
  .done(function(data){
    var html = buildHTML(data);
    $('.show-comment_detail__form__submit__under').append(html);
    $('.show-comment__detail__form').val('');
    $('.show-comment__detail__form__submit').prop('disabled', false);
  })
})
});
