(function(){
    ('#input-file').change(function(){
        ('img').remove();
        var file = (this).prop('files')[0];
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            ('#preview').html('<img src="' + fileReader.result + '"/>');
            ('img').addClass('resize-image');
        };
        fileReader.readAsDataURL(file);
    });
});