$(document).ready(function() {
    window.addEventListener('message', function(event) {
        const item = event.data;
        const playerdata = item.playerdata;
        const job = item.jobs;
        const mugshot = item.mugshot;
        if (item.open == true) {
            $('.container').css('display', 'grid');
            $('#name').html(playerdata.name);
            $('#job').html(playerdata.job);
            $('#cash').html('  $' + playerdata.money);
            $('#bank').html('  $' + playerdata.bank);
            $('#officers').html('<i class="fas fa-user-shield"></i>' + job.police);
            $('#ems').html('<i class="fas fa-ambulance"></i>' + job.ambulance);
            $('#mechanics').html('<i class="fas fa-tools"></i>' + job.mechanic);
            $('#taxi').html('<i class="fas fa-taxi"></i>' + job.taxi);
            $('.userimage img').attr('src', mugshot);
        }
    });

    $('#close, #settings, #map').click(function() {
        $.post('https://dei_pausemenu/Option', JSON.stringify({
            option: $(this).attr('id')
        }));
        $('.container').css('display', 'none');
    });
});