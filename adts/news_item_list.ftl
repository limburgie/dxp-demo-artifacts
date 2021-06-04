<#if entries?has_content>
    <div class="row">
        <#list entries as curEntry>
            <#assign
            assetRenderer = curEntry.getAssetRenderer()
            journalArticle = assetRenderer.getAssetObject()
            viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, assetRenderer, curEntry, !stringUtil.equals(assetLinkBehavior, "showFullContent"))
            />

            <#if curEntry?index == 0>
                <div class="col-md-12 mb-4">
                    <div style="background-color: var(--white);border-radius: var(--border-radius-lg);" class="p-4">
                        <@liferay_journal["journal-article"]
                        articleId=journalArticle.getArticleId()
                        ddmTemplateKey="52300"
                        groupId=journalArticle.getGroupId()
                        />

                        <div class="pb-4">
                            <@rating curEntry/>&nbsp;&nbsp;&nbsp;&nbsp;<@comments curEntry/>
                        </div>
                        <div>
                            <a href="${viewURL}" class="btn btn-sm btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
            <#else>
                <div class="col-md-6">
                    <div style="background-color: var(--white);">
                        <@liferay_journal["journal-article"]
                        articleId=journalArticle.getArticleId()
                        ddmTemplateKey="47327"
                        groupId=journalArticle.getGroupId()
                        />

                        <div class="pl-4 pr-4 pb-4">
                            <@rating curEntry/>&nbsp;&nbsp;&nbsp;&nbsp;<@comments curEntry/>
                        </div>

                        <div class="pl-4 pr-4 pb-4">
                            <a href="${viewURL}" class="btn btn-sm btn-primary w-100">
                                <@liferay_ui["message"] key="read-more"/>
                            </a>
                        </div>
                    </div>
                </div>
            </#if>
        </#list>
    </div>
</#if>

<#macro rating assetEntry>
    <#assign ratingsStatsService = serviceLocator.findService("com.liferay.ratings.kernel.service.RatingsStatsLocalService")>

    <#if ratingsStatsService.fetchStats(assetEntry.className, assetEntry.classPK)??>
        <#assign ratingsStats = ratingsStatsService.getStats(assetEntry.className, assetEntry.classPK)>
        <#assign score = getterUtil.getInteger(ratingsStats.totalScore)>
    <#else>
        <#assign score = 0>
    </#if>

    <svg class="lexicon-icon lexicon-icon-thumbs-up" role="presentation">
        <use xlink:href="http://localhost:8080/o/admin-theme/images/clay/icons.svg#thumbs-up"></use>
    </svg>&nbsp;&nbsp;${score}
</#macro>

<#macro comments assetEntry>
    <#assign mbMessageService = serviceLocator.findService("com.liferay.message.boards.service.MBMessageLocalService")>
    <#assign msgCount = mbMessageService.getDiscussionMessagesCount(assetEntry.className, assetEntry.classPK, 0)>
    <svg class="lexicon-icon lexicon-icon-comments" role="presentation">
        <use xlink:href="http://localhost:8080/o/admin-theme/images/clay/icons.svg#comments"></use>
    </svg>&nbsp;&nbsp;${msgCount}
</#macro>