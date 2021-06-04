<#include "${templatesPath}/NAVIGATION-MACRO-FTL" />

<#if !entries?has_content>
    <#if themeDisplay.isSignedIn()>
        <div class="alert alert-info">
            <@liferay.language key="there-are-no-menu-items-to-display" />
        </div>
    </#if>
<#else>
    <div aria-label="<@liferay.language key="site-pages" />" class="styled-list-menu">
        <@buildNavigation
        branchNavItems=branchNavItems
        cssClass="layouts"
        displayDepth=displayDepth
        includeAllChildNavItems=true
        navItemLevel=1
        navItems=entries
        />
    </div>
</#if>

<style type="text/css">
    div.styled-list-menu ul {
        border-left: 1px solid #E5E5E5;
        margin: 0 0 0 8px;
        padding: 0 0 0 8px;
    }
    div.styled-list-menu ul.level-1 {
        margin: 0;
        border: 0;
        padding: 0;
    }
    div.styled-list-menu ul.level-1 > li > a {
        font-weight: 600;
    }
    div.styled-list-menu ul.level-1 > li > a:hover, div.styled-list-menu ul.level-1 > li > a:active, div.styled-list-menu ul.level-1 > li > a:focus, div.styled-list-menu ul.level-1 > li > a.active {
        font-weight: 600;
    }
    div.styled-list-menu ul li {
        list-style: none;
        margin: 0;
        padding: 0;
    }
    div.styled-list-menu ul li a {
        display: inline-block;
        margin: 4px;
        padding: 4px;
        color: #000;
        border-bottom: 1px solid #fff;
        text-decoration: none;
    }
    div.styled-list-menu ul li a:hover, div.styled-list-menu ul li a:active, div.styled-list-menu ul li a:focus, div.styled-list-menu ul li a.active {
        text-decoration: none;
        color: #000;
        font-weight: 500;
        border-bottom: 1px solid #E0B947;
    }
</style>