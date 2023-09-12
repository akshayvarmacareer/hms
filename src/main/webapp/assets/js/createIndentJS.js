/**
 * 
 */
 $('.add').click(function() {
    $('.block:last').before('<div class="block"> <input type="text" class="form-control col-md-5" placeholder="Enter your Vehcile"/><br> <span class="badge badge-round-danger remove" style="right-margin:193px" >X</span></div>');
});
$('.optionBox').on('click','.remove',function() {
            $(this).parent().remove();
});

$('.add2').click(function() {
    $('.block2:last').before('<div class="block2"> <input type="text" class="form-control col-md-5" placeholder="Enter your Vehcile Issues"/><br> <span class="badge badge-round-danger remove2" style="right-margin:193px" >X</span></div>');
});
$('.optionBox2').on('click','.remove2',function() {
            $(this).parent().remove();
});