AUI().use('aui-base', function(A) {
    // your code here
}

AUI().use("liferay-menu",
    function(A){
        Liferay.Menu.register('_com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet_abcd___menu');
    }
);