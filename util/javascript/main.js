// javascript example.
// gollum is bundle jQuery1.7.
// if you do not need to parse to twemoji,
// delete below script.

$(() => {
    let page_html = $('.page').html();
    if (page_html) {
        $('.page').html(twemoji.parse(page_html));
    }

    let menu_action = $('<div/>')
        .addClass('menu-action')
        .text('MENU');
    $('#head').append(menu_action);
    $(document).on('click', '.menu-action', () => {
        $('.actions:first').slideToggle('fast');
    });
});
