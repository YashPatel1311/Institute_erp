(function($) {
    $(function() {
        var role = $("#id_role"),
            student_grp = $('#student-group'),
            faculty_grp = $('#faculty-group'),
            redundant_stu = $('#student-0 h3'),
            redundant_fac = $('#faculty-0 h3');

        redundant_stu.hide();
        redundant_fac.hide();


        function toggleRole(role) {

            if (role == "0" || role == "false") {
                student_grp.hide();
                faculty_grp.show();
            } else if (role == "1" || role == "true") {
                student_grp.show();
                faculty_grp.hide();
            } else if (role == "" || role == "unknown") {
                student_grp.hide();
                faculty_grp.hide();
            }

        }

        // function togglestudent(stu) {

        //     if (stu == true) {
        //         student_grp.show();
        //         faculty_grp.hide();
        //     }
        // }


        // function toggleunknown(un) {

        //     if (un == true) {
        //         student_grp.hide();
        //         faculty_grp.hide();
        //     }
        // }




        // show/hide on load based on pervious value of selectField
        toggleRole(role.prop("value"));

        // show/hide on change
        role.change(function() {
            toggleRole($(this).prop("value"));
        });

        // faculty.change(function() {
        //     togglefaculty($(this).prop("checked"));
        // });

        // unknown.change(function() {
        //     toggleunknown($(this).prop("checked"));
        // });

    });
})(django.jQuery);