<#setting locale=locale>

<#if !entries?has_content>
    <#if !themeDisplay.isSignedIn()>
        ${renderRequest.setAttribute("PORTLET_CONFIGURATOR_VISIBILITY", true)}
    </#if>

    <div class="alert alert-info">
        <@liferay_ui["message"] key="there-are-no-results" />
    </div>
<#else>
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

        <div style="display: flex; flex-direction: row; margin-bottom: 16px;">
            <div style="min-width: 50px;">
                <div style="font-size: 2.5rem; margin-top: -8px">
                    <#if fileEntry.mimeType?starts_with("image")>
                        <@icon type="document-image" color="#7ACEB6"/>
                    <#elseif fileEntry.mimeType?starts_with("video") || fileEntry.mimeType?starts_with("audio")>
                        <@icon type="document-multimedia" color="#6571D9"/>
                    <#elseif fileEntry.mimeType?contains("pdf")>
                        <@icon type="document-pdf" color="#D8534D"/>
                    <#elseif fileEntry.mimeType?contains("msword") || fileEntry.mimeType?contains("wordprocessingml") || fileEntry.mimeType?contains("opendocument.text")>
                        <@icon type="document-text" color="#4A7DED"/>
                    <#elseif fileEntry.mimeType?contains("ms-excel") || fileEntry.mimeType?contains("spreadsheetml")>
                        <@icon type="document-table" color="#49A363"/>
                    <#elseif fileEntry.mimeType?contains("ms-powerpoint") || fileEntry.mimeType?contains("presentationml")>
                        <@icon type="document-presentation" color="#DD6B3B"/>
                    <#elseif fileEntry.mimeType?contains("xml")>
                        <@icon type="document-code" color="#404040"/>
                    <#elseif fileEntry.mimeType?contains("zip") || fileEntry.mimeType?contains("rar")>
                        <@icon type="document-compressed" color="#DBA138"/>
                    <#else>
                        <@icon type="document-default" color="#777"/>
                    </#if>
                </div>
            </div>
            <div>
                <div>
                    <a href="${detailURL}" style="color: inherit;">
                        ${entryTitle}
                    </a>
                </div>
                <small class="text-muted">${fileEntry.userName} • ${entry.modifiedDate?date?string.long} • ${si(fileEntry.size)}</small>
            </div>
        </div>
    </#list>
</#if>

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


<#macro icon type color>
    <span style="color: ${color}">
    	<@liferay_ui["icon"]
        icon="${type}"
        markupView="lexicon"
        style="display: block"
        />
	</span>
</#macro>

<#function si num>
    <#assign order = num?round?c?length>
    <#assign thousands = ((order - 1) / 3)?floor>
    <#if (thousands < 0)><#assign thousands = 0></#if>
    <#assign siMap = [ {"factor": 1, "unit": "bytes"}, {"factor": 1000, "unit": "kB"}, {"factor": 1000000, "unit": "MB"}, {"factor": 1000000000, "unit":"GB"}, {"factor": 1000000000000, "unit": "TB"} ]>
    <#assign siStr = (num / (siMap[thousands].factor))?string("0 ") + siMap[thousands].unit>
    <#return siStr>
</#function>