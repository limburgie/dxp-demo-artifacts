<div class="mt-5 mt-md-0">
	<h2>OVAM.link magazines</h2>
    <#if !entries?has_content>
        <#if !themeDisplay.isSignedIn()>
            ${renderRequest.setAttribute("PORTLET_CONFIGURATOR_VISIBILITY", true)}
        </#if>

		<div class="alert alert-info">
            <@liferay_ui["message"] key="there-are-no-results" />
		</div>
    <#else>
		<ul style="margin: 0;padding: 0">
            <#list entries as entry>
                <#assign
                entry = entry
                assetRenderer = entry.getAssetRenderer()
                fileEntry = assetRenderer.getAssetObject()
                entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale))
                viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, assetRenderer, entry, !stringUtil.equals(assetLinkBehavior, "showFullContent"))
                viewURL = httpUtil.setParameter(viewURL, "p_p_state", "maximized")
                detailURL = assetRenderer.getURLView(renderResponse, windowStateFactory.getWindowState("maximized"))
                />

				<li style="list-style-type: none;">
					<div class="clearfix">
						<div class="pull-right">
                            <@getPrintIcon /> <@getEditIcon />
						</div>
						<span class="doc-icon">
						<img src="/o/classic-theme/images/file_system/small/${fileEntry.extension}.png"/>
					</span>
						<a href="${detailURL}">
                            ${entryTitle}
						</a>
					</div>
				</li>
            </#list>
		</ul>
    </#if>
</div>

<#macro getEditIcon>
    <#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>
        <#assign redirectURL = renderResponse.createRenderURL() />
        ${redirectURL.setParameter("mvcPath", "/add_asset_redirect.jsp")}
        ${redirectURL.setWindowState("pop_up")}
        <#assign editPortletURL = assetRenderer.getURLEdit(renderRequest, renderResponse, windowStateFactory.getWindowState("pop_up"), redirectURL)!"" />
        <#if validator.isNotNull(editPortletURL)>
            <#assign title = languageUtil.format(locale, "edit-x", entryTitle, false) />
            <@liferay_ui["icon"] cssClass="icon-monospaced visible-interaction" icon="pencil" markupView="lexicon" message=title url="javascript:Liferay.Util.openWindow({id:'" + renderResponse.getNamespace() + "editAsset', title: '" + title + "', uri:'" + htmlUtil.escapeURL(editPortletURL.toString()) + "'});" />
        </#if>
    </#if>
</#macro>

<#macro getPrintIcon>
    <#if getterUtil.getBoolean(enablePrint)>
        <#assign printURL = renderResponse.createRenderURL() />
        ${printURL.setParameter("mvcPath", "/view_content.jsp")}
        ${printURL.setParameter("assetEntryId", entry.getEntryId()?string)}
        ${printURL.setParameter("viewMode", "print")}
        ${printURL.setParameter("type", entry.getAssetRendererFactory().getType())}
        <#if assetRenderer.getUrlTitle()?? && validator.isNotNull(assetRenderer.getUrlTitle())>
            <#if assetRenderer.getGroupId() != themeDisplay.getScopeGroupId()>
                ${printURL.setParameter("groupId", assetRenderer.getGroupId()?string)}
            </#if>
            ${printURL.setParameter("urlTitle", assetRenderer.getUrlTitle())}
        </#if>
        ${printURL.setWindowState("pop_up")}
        <@liferay_ui["icon"] iconCssClass="icon-print" message="print" url="javascript:Liferay.Util.openWindow({id:'" + renderResponse.getNamespace() + "printAsset', title: '" + languageUtil.format(locale, "print-x-x", ["hide-accessible", entryTitle], false) + "', uri: '" + htmlUtil.escapeURL(printURL.toString()) + "'});" />
    </#if>
</#macro>