$(function() {
  function buildImg(index, url) {
    const html = `<div class="box__file__img__wrapper" data-index="${index}">
                    <img data-index="${index}" src="${url}">
                    <div class="box__file__img__wrapper__delete" data-index="${index}">削除する</div>
                  </div>`;
    return html;
  }

  function buildFileField(index) {
    const html = `<input class="box__file__field--file" data-index="${index}" type="file" name="item[item_images_attributes][${index}][src]" id="item_item_images_attributes_${index}_src">`;

    return html;
  }

  function selectWidth(fileCount, num) {
    if (fileCount <= num) {
      const imgWidth = (fileCount) * 105;
      $('#img-box').css({'width':`${imgWidth}px`});
      $('#file-box').css({'width':`calc(100% - ${imgWidth}px)`});
    }
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  let fileCount = 0;

  $('#file-box').on('click', '.box__file__field--file', function(e) {
    if (fileCount > 9) {
      alert('最大10枚までです');
      return false;
    }
  });
  $('#file-box').on('change', '.box__file__field--file', function(e) {
    if (fileCount <= 9) {
          $('#file-box').append(buildFileField(fileIndex[0]));
          $(`#item_item_images_attributes_${fileIndex[0] - 1}_src`).hide();
      
          const file = e.target.files[0];
          const blobUrl = window.URL.createObjectURL(file);
          fileCount += 1;       
          selectWidth(fileCount, 5);
          $('#img-box').append(buildImg(fileIndex[0] - 1, blobUrl)); 
          
          fileIndex.shift();
          fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });
  $('#img-box').on('click', '.box__file__img__wrapper__delete', function(e) {
    const targetIndex = $(this).data('index');
    $(this).parent().remove();
    $(`#item_item_images_attributes_${targetIndex}_src`).remove();
    fileCount -= 1;
    selectWidth(fileCount, 5);
  });
  
})