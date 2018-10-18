// javascript example.
// gollum is bundle jQuery1.7.
// if you do not need to parse to twemoji,
// delete below script.

$(() => {
    let page_html = $('.page').html();
    if (page_html) {
        $('.page').html(twemoji.parse(page_html));
    }
});
