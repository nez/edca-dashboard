window.log = function() {
    log.history = log.history || [];
    log.history.push(arguments);
    if (this.console) {
        arguments.callee = arguments.callee.caller;
        var a = [].slice.call(arguments);
        (typeof console.log === "object" ? log.apply.call(console.log, console, a) : console.log.apply(console, a))
    }
};
(function(b) {
    function c() {}
    for (var d = "assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,timeStamp,profile,profileEnd,time,timeEnd,trace,warn".split(","), a; a = d.pop();) {
        b[a] = b[a] || c
    }
})((function() {
    try {
        console.log();
        return window.console;
    } catch (err) {
        return window.console = {};
    }
})());

var initialise_form = function (selectionOptions) {
    var filterers = $('.filter_block input');
    filterers.change(function() {
        var filters = [];
        var targets = [];
        filterers.filter(function () {
            return !this.checked
        }).each(function (k,v) {
            filters[k] = v.value;
            targets[k] = $(v).data('target');
        });
        use_filters(filters,targets);
    });

    var groupSelect = $('#group-everything-by');
    for (var opt in selectionOptions) {
        var lookup = selectionOptions[opt];
        groupSelect.append('<option value="' + lookup.key + '">' + lookup.title + '</option>');
    }
    var ResetGrouping = function () {
        var groupBy = groupSelect.val();
        group_by(groupBy);
    };

    groupSelect.change(ResetGrouping);

    var colorSelect = $('#color-everything-by');
    for (var opt in selectionOptions) {
        var lookup = selectionOptions[opt];
        colorSelect.append('<option value="' + lookup.key + '">' + lookup.title + '</option>');
    }
    var ResetColors = function () {
        var colorBy = colorSelect.val();
        color_by(colorBy);
    };

    $('#clear_filters').click(function () {
        if($(this).hasClass('select')) {
            $('.filter_block input').prop('checked', 'checked');
        }
        else {
            $('.filter_block input').prop('checked', false);
        }
        $(this).toggleClass('select clear');
        filterers.change();
        return false;
    });

    colorSelect.change(ResetColors);
};

function get_distinct_values(csv, keyType, key) {
    var allValues = {};
    for (var i in csv) {
        var value = csv[i][key];
        allValues[value] = true;
    }

    var allValuesArray = [];
    for (var i in allValues)
        allValuesArray.push(i);

    allValuesArray.sort();
    return allValuesArray
}

function keyToLookup(key) {
    var firstPartEnds = key.indexOf(':');
    if (firstPartEnds <= 0)
        return { key: key, type: key, title: key };

    var firstPart = key.substring(0, firstPartEnds);
    var secondPart = key.substring(firstPartEnds + 1);

    return { key: key, type: firstPart, title: secondPart };
}

function render_filters_colors_and_groups(csv) {
    var first = csv[0];

    var lookups = [];
    for (var key in first) {
        var lookup = keyToLookup(key);

        
        
        
        
        
        // SELECCIONA LOS CAMPOS A FILTRAR
        switch (lookup.type) {
            case "Proveedor":
            case "ID de contrato":
            case "Tipo de contratación":
            case "Vigencia":
                lookups.push(lookup);
                break;
            default:
                break;
        }
        
        
        
        
        
        
        
    }
    var filterList = $('#filter-list');
    for (var i in lookups) {
        var lookup = lookups[i];
        var values = get_distinct_values(csv, lookup.type, lookup.key);
        var item = $('<div class="filter_block dropdown-header"><li class="filter_title"><p style="color:#96CA45;"><strong>' + lookup.title + '</strong></p></li></div>');
        for (var j in values) {
            var checkbox = $('<li class="sub-filter-block"><label style="cursor:pointer"><input style="cursor:pointer" data-target="' + lookup.key + '" type="checkbox" checked="checked" value="' + values[j] + '"/> ' + values[j] + '</label></li>');
            checkbox.appendTo(item);
        }
        item.appendTo(filterList);
    }
    initialise_form(lookups);
}

function hide_color_chart() {
    var colorbar = $('#color-hints');
    colorbar.fadeOut(500, function () {
        $(this).empty();
    });
}
function show_color_chart(what_to_color_by, color_mapper) {
    var colorbar = $('#color-hints');
    //console.log(color_mapper);
    colorbar.fadeOut(500, function () {
        colorbar.empty();

        var lookup = keyToLookup(what_to_color_by);
        $('<h4>' + lookup.title + ':</h4>').appendTo(colorbar);

        var table = $('<table class="table" />');
        for (var key in color_mapper) {
            var row = $('<tr/>');

            var cell = $('<td/>');
            var square = $('<div style="width: 15px; height: 15px; background: ' + color_mapper[key] + ';">&nbsp;</div>');
            square.appendTo(cell);
            cell.appendTo(row);

            cell = $('<td/>');
            cell.text(' ' + key + ' ');
            cell.appendTo(row);
            row.appendTo(table);
        }
        table.appendTo(colorbar);
        colorbar.fadeIn(500);
    });
}