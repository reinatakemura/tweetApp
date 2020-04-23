$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      // onloadプロパティは既にFileReaderオブジェクト（またはreaderインスタンス）に存在しており、既に存在しているプロパティに上書きしている
      // FileReaderではファイルを読み込むとloadイベントが発生するため、FileReaderのonloadにファイルのロードが完了した際に行う処理
      reader.onload = function (e) {
        // 対象要素(.prev-image)の属性(src)を(e.target.resultに)変更する
        // e.target.resultはファイルのURLの取得
        $('.prev-image').attr('src', e.target.result);
      }
      // FileReaderインスタンスを生成し、readAsDataURLメソッドに先ほど取得したファイルを渡す
      reader.readAsDataURL(input.files[0]);
    }
  }
  // セレクタ(.image_form)の値が変更されたときの処理
  $(".image_form").change(function(){
    readURL(this);
  });
 });
