<#if entries?has_content>
    <div style="background-color: var(--white);border-radius: var(--border-radius-lg);" class="p-4">
        <#list entries as curEntry>
            <#assign
            assetRenderer = curEntry.getAssetRenderer()
            journalArticle = assetRenderer.getAssetObject()
            viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, assetRenderer, curEntry, !stringUtil.equals(assetLinkBehavior, "showFullContent"))
            />

            <div class="d-flex align-items-center">
                <@liferay_journal["journal-article"]
                articleId=journalArticle.getArticleId()
                ddmTemplateKey="57996"
                groupId=journalArticle.getGroupId()
                />
                <div class="ml-auto">
                    <a href="${viewURL}" class="btn btn-sm btn-primary">&raquo;</a>
                </div>
            </div>
        </#list>
    </div>
</#if>