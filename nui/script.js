$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var item = event.data;
        var playerdata = item.playerdata;
        console.log(JSON.stringify(playerdata));
        if (item.open == true) {
            $('.container').css('display', 'grid');
            $('#name').html(playerdata.name);
            $('#job').html(playerdata.job);
            $('#cash').html(' $' + playerdata.money);
            $('#bank').html(' $' + playerdata.bank);
        }
        else if (item.open == false) {
            $('.container').css('display', 'none');
        }
    });

    $('#close').click(function() {
        $.post('https://dei_pausemenu/Close', JSON.stringify({}));
    });
});