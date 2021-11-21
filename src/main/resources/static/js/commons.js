$(document).ready(function () {
    $(".number-only").keypress(function (event) {
        return event.charCode >= 48 && event.charCode <= 57 || event.charCode == 0;
    });

    $(".email").keypress(function () {
        var emailTxt = this.value;
        var valid = isEmail(emailTxt);
        if (!valid) {
            $(this).addClass("parsley-error");
        } else {
            $(this).removeClass("parsley-error");
        }
    });

});

function isEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

function validateForm(formName) {
    var form = document.getElementById(formName);
    var requiredFields = form.getElementsByClassName("required");
    var fieldValid = true;
    for (var i = 0; i < requiredFields.length; i++) {
        if ($("#" + requiredFields[i].id).val() == "") {
            $("#" + requiredFields[i].id).addClass("parsley-error");
            fieldValid = false;
        }
    }
    if (!fieldValid) {
        //var formValidationText = $("#formValidationText").val();
        //showError(formValidationText);
        //validationError = true;
        return false;
    }
    return fieldValid;
}


function ConvertFormToJSON(form) {
    var array = jQuery(form).serializeArray();
    var json = {};

    jQuery.each(array, function () {
        json[this.name] = $.trim(this.value) || '';
    });

    var jsonStr = JSON.stringify(json);
    /*var jsonArr = jsonStr.split(",");
    var result = "";
    for(var i = 0 ; i < jsonArr.length; i++){
    	jsonArr[i] = jsonArr[i].split(":")[0].replace('"', '').replace('"', '') + ":" +jsonArr[i].split(":")[1].replace("'","\"").replace("'","\"");
    	if(i < jsonArr.length-1){
    		result += jsonArr[i]+",";
    	}else{
    		result += jsonArr[i];
    	}
    }*/

    return jsonStr;
}

function convertFormToJSON(form, multipleSelectIds) {
    var array = jQuery(form).serializeArray();
    var json = {};

    jQuery.each(array, function () {
        if (this.name != multipleSelectIds) {
            json[this.name] = $.trim(this.value) || '';
        }
    });
    if (multipleSelectIds != null && multipleSelectIds != '') {
        var ids = multipleSelectIds.split(";");
        for (var i = 0; i < ids.length; i++) {
            var values = $("#" + ids[i]).val();
            json[ids[i]] = values;
        }
    }
    var jsonStr = JSON.stringify(json);

    return jsonStr;
}

function convertObjToJSON(object) {
    var array = jQuery(object).serializeArray();
    var json = {};

    jQuery.each(array, function () {
        json[this.name] = $.trim(this.value) || '';
    });

    var jsonStr = JSON.stringify(json);
    /*var jsonArr = jsonStr.split(",");
    var result = "";
    for(var i = 0 ; i < jsonArr.length; i++){
    	jsonArr[i] = jsonArr[i].split(":")[0].replace('"', '').replace('"', '') + ":" +jsonArr[i].split(":")[1].replace("'","\"").replace("'","\"");
    	if(i < jsonArr.length-1){
    		result += jsonArr[i]+",";
    	}else{
    		result += jsonArr[i];
    	}
    }*/

    return jsonStr;
}

function refreshCurrentPage() {
    location.reload();
}

function changeLocale(requestedLocale) {
    $.get("/clinic/changeLocale", {requestedLocale: requestedLocale}, function () {
        refreshCurrentPage();
    });
}


function convertToJSONObject(formId) {
    var arrayData, objectData;
    arrayData = jQuery(formId).serializeArray();
    objectData = {};

    $.each(arrayData, function () {
        this.value = !this.value ? '' : this.value;
        processObject(objectData, this.name, this.value);
    });

    return objectData;
};

function processObject(obj, key, value) {
    if (key.indexOf('.') != -1) {
        var attrs = key.split('.');
        var tx = obj;
        for (var i = 0; i < attrs.length - 1; i++) {
            var isArray = attrs[i].indexOf('[') != -1;
            var isNestedArray = isArray && (i != attrs.length - 1);
            var nestedArrayIndex = null;
            if (isArray) {
                nestedArrayIndex = attrs[i].substring(attrs[i].indexOf('[') + 1, attrs[i].indexOf(']'));
                attrs[i] = attrs[i].substring(0, attrs[i].indexOf('['));
                if (tx[attrs[i]] == undefined) {
                    tx[attrs[i]] = [];
                }
                tx = tx[attrs[i]];
                if (isNestedArray) {
                    if (tx[nestedArrayIndex] == undefined) {
                        tx[nestedArrayIndex] = {};
                    }
                    tx = tx[nestedArrayIndex];
                }

            } else {
                if (tx[attrs[i]] == undefined) {
                    tx[attrs[i]] = {};
                }
                tx = tx[attrs[i]];
            }
        }
        processObject(tx, attrs[attrs.length - 1], value);
    } else {
        var finalArrayIndex = null;
        if (key.indexOf('[') != -1) {
            finalArrayIndex = key.substring(key.indexOf('[') + 1, key.indexOf(']'));
            key = key.substring(0, key.indexOf('['));
        }
        if (finalArrayIndex == null) {
            obj[key] = value;
        } else {
            if (obj[key] == undefined) {
                obj[key] = [];
            }
            obj[key][finalArrayIndex] = value;
        }
    }
}

function nextPage(url, responseDiv, formId) {
    var currentPage = $("#current").val();
    var totalNumberOfPages = $("#total").val();
    var size = $("#size").val();
    var nextPage = parseInt(currentPage) + 1;
    if (nextPage < parseInt(totalNumberOfPages)) {
        if (formId != null) {
            var form = convertToJSONObject("#" + formId);
            loadTableForm(url, responseDiv, form, nextPage, size)
        } else {
            loadTable(url, responseDiv, nextPage, size)
        }
    }
}

function previousPage(url, responseDiv, formId) {
    event.preventDefault();
    var currentPage = $("#current").val();
    var size = $("#size").val();
    var previousPage = parseInt(currentPage) - 1;
    if (previousPage >= 0) {
        if (formId != null) {
            var form = convertToJSONObject("#" + formId);
            loadTableForm(url, responseDiv, form, previousPage, size)
        } else {
            loadTable(url, responseDiv, previousPage, size)
        }
    }
}

function changeTableSize(url, responseDiv, formId) {
    event.preventDefault();
    var size = $("#size").val();
    if (formId != null) {
        var form = convertToJSONObject("#" + formId);
        loadTableForm(url, responseDiv, form, 0, size)
    } else {
        loadTable(url, responseDiv, 0, size)
    }
}

function loadTable(url, responseDiv, page, size) {
    event.preventDefault();
    $.ajax({
        type: 'GET',
        url: $("#applicationContext").val() + url + "/" + page + "/" + size,
        success: function (data) {
            $("#" + responseDiv).html(data);
        }
    });
}

function loadTableForm(url, responseDiv, form, page, size) {
    $.ajax({
        type: 'POST',
        url: $("#applicationContext").val() + url + "/" + page + "/" + size,
        data: JSON.stringify(form),
        contentType: "application/json",
        success: function (data) {
            $("#" + responseDiv).html(data);
        }
    });
}


