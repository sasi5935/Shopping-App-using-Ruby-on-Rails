const filters = { emoji_type: "", shape: "", price: "" };

function toggleFilter() {
    document.querySelector(".filters_container_wrapper").classList.toggle('hidden');
}

function showFilterOptions(className) {
    document.querySelector("." + className).classList.toggle('hidden');
}

function applyFilter(e, key, filter) {
    document.querySelectorAll(".filter_to_apply." + key).forEach(element => {
        element.classList.remove('active_option');
    });
    e.classList.add('active_option');
    filters[key] = filter;

    jQuery.ajax({
        url: `/cushion_filters?emoji_type=${filters["emoji_type"]}&shape=${filters["shape"]}&price=${filters["price"]}`,
        dataType: "script"
    });

    document.querySelector(`.filter_options.${key}`).classList.add("hidden");
}

