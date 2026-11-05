sap.ui.define([
    "sap/ui/test/opaQunit",
    "./pages/JourneyRunner"
], function (opaTest, runner) {
    "use strict";

    function journey() {
        QUnit.module("First journey");

        opaTest("Start application", function (Given, When, Then) {
            Given.iStartMyApp();

            Then.onTheStudentList.iSeeThisPage();
            Then.onTheStudentList.onFilterBar().iCheckFilterField("First_name");
            Then.onTheStudentList.onFilterBar().iCheckFilterField("Last_name");
            Then.onTheStudentList.onTable().iCheckColumns(2, {"First_name":{"header":"First name"},"Last_name":{"header":"Last name"}});

        });


        opaTest("Navigate to ObjectPage", function (Given, When, Then) {
            // Note: this test will fail if the ListReport page doesn't show any data
            
            When.onTheStudentList.onFilterBar().iExecuteSearch();
            
            Then.onTheStudentList.onTable().iCheckRows();

            When.onTheStudentList.onTable().iPressRow(0);
            Then.onTheStudentObjectPage.iSeeThisPage();

        });

        opaTest("Teardown", function (Given, When, Then) { 
            // Cleanup
            Given.iTearDownMyApp();
        });
    }

    runner.run([journey]);
});