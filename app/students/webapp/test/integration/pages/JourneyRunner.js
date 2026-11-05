sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"students/test/integration/pages/StudentList",
	"students/test/integration/pages/StudentObjectPage",
	"students/test/integration/pages/FavoriteGameObjectPage"
], function (JourneyRunner, StudentList, StudentObjectPage, FavoriteGameObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('students') + '/test/flp.html#app-preview',
        pages: {
			onTheStudentList: StudentList,
			onTheStudentObjectPage: StudentObjectPage,
			onTheFavoriteGameObjectPage: FavoriteGameObjectPage
        },
        async: true
    });

    return runner;
});

