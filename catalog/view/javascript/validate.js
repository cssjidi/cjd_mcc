(function ($,undefined) {
    var cjd_validator = function () {
        
    };
    cjd_validator.prototype = {
        constructor:cjd_validator,
        validate:function ($element,$rule) {
            $($element).$rule();
        },
    }
    cjd_validator.prototype.rules = {
        isEmpty:function (obj) {
            return !($.trim(obj) == '');
        }
    }
}(jQuery));