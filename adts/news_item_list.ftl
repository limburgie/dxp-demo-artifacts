<div class="mt-5 mt-md-0">
	<h2>Laatste nieuws</h2>

    <#if !entries?has_content>
        <#if !themeDisplay.isSignedIn()>
            ${renderRequest.setAttribute("PORTLET_CONFIGURATOR_VISIBILITY", true)}
        </#if>

		<div class="alert alert-info">
			Geen nieuwsberichten gevonden.
		</div>
    </#if>

    <#list entries as entry>
        <#assign
        entry = entry
        assetRenderer = entry.getAssetRenderer()
        journalArticle = assetRenderer.getAssetObject()
        journalArticleService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")
        content = journalArticleService.getArticleDisplay(journalArticle, "34717", "view", themeDisplay.languageId, 1, null, null).getContent()
        entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale))
        viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, assetRenderer, entry, !stringUtil.equals(assetLinkBehavior, "showFullContent"))
        />


		<hr/>
		<div class="news-item">
			<div class="pull-right">
                <@getPrintIcon /> <@getEditIcon />
			</div>
            ${content}
			<div class="row">
				<div class="col-md-12">
					<p>
						<a href="${viewURL}" class="btn btn-nm btn-secondary">
							Bericht lezen
						</a>
					</p>
				</div>
			</div>
		</div>

    </#list>
</div>

<#macro getDiscussion>
    <#if getterUtil.getBoolean(enableComments) && assetRenderer.isCommentable()>
		<br/>
        <#assign discussionURL = renderResponse.createActionURL() />
        ${discussionURL.setParameter("javax.portlet.action", "invokeTaglibDiscussion")}
        <@liferay_comment["discussion"] className=entry.getClassName() classPK=entry.getClassPK() formAction=discussionURL?string formName="fm" + entry.getClassPK() ratingsEnabled=getterUtil.getBoolean(enableCommentRatings) redirect=currentURL userId=assetRenderer.getUserId() />
    </#if>
</#macro>

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

<#macro getMetadataField fieldName >
    <#if stringUtil.split(metadataFields)?seq_contains(fieldName)>
		<span class="metadata-entry metadata-${fieldName}">
			<#assign dateFormat = "dd MMM yyyy - HH:mm:ss" />
            <#if stringUtil.equals(fieldName, "author")>
                <@liferay.language key="by" /> ${htmlUtil.escape(portalUtil.getUserName(assetRenderer.getUserId(), assetRenderer.getUserName()))}
            <#elseif stringUtil.equals(fieldName, "categories")>
                <@liferay_asset["asset-categories-summary"] className=entry.getClassName() classPK=entry.getClassPK() portletURL=renderResponse.createRenderURL() />
            <#elseif stringUtil.equals(fieldName, "create-date")>
                ${dateUtil.getDate(entry.getCreateDate(), dateFormat, locale)}
            <#elseif stringUtil.equals(fieldName, "expiration-date")>
                ${dateUtil.getDate(entry.getExpirationDate(), dateFormat, locale)}
            <#elseif stringUtil.equals(fieldName, "modified-date")>
                ${dateUtil.getDate(entry.getModifiedDate(), dateFormat, locale)}
            <#elseif stringUtil.equals(fieldName, "priority")>
                ${entry.getPriority()}
            <#elseif stringUtil.equals(fieldName, "publish-date")>
                ${dateUtil.getDate(entry.getPublishDate(), dateFormat, locale)}
            <#elseif stringUtil.equals(fieldName, "tags")>
                <@liferay_asset["asset-tags-summary"] className=entry.getClassName() classPK=entry.getClassPK() portletURL=renderResponse.createRenderURL() />
            <#elseif stringUtil.equals(fieldName, "view-count")> ${entry.getViewCount()}
                <@liferay.language key="views" />
            </#if>
		</span>
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

<#macro getRatings>
    <#if getterUtil.getBoolean(enableRatings) && assetRenderer.isRatable()>
		<div class="asset-ratings">
            <@liferay_ui["ratings"] className=entry.getClassName() classPK=entry.getClassPK() />
		</div>
    </#if>
</#macro>

<#macro getRelatedAssets>
    <#if getterUtil.getBoolean(enableRelatedAssets)>
        <@liferay_asset["asset-links"] assetEntryId=entry.getEntryId() viewInContext=!stringUtil.equals(assetLinkBehavior, "showFullContent") />
    </#if>
</#macro>

<#macro getSocialBookmarks>
    <@liferay_social_bookmarks["bookmarks"] className=entry.getClassName() classPK=entry.getClassPK() displayStyle="${socialBookmarksDisplayStyle}" target="_blank" title=entry.getTitle(locale) url=viewURL />
</#macro>