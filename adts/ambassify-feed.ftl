<#assign rssPortletInstanceConfiguration = rssDisplayContext.getRSSPortletInstanceConfiguration() />

<#if entries?has_content>
    <#assign feed = entries?first/>
    <#assign campaigns = feed.getRSSFeedEntries(themeDisplay) />

    <#if campaigns??>
        <div style="background-color: #3FB38D;border-radius: var(--border-radius-lg);" class="p-4">
            <div class="d-flex align-items-center">
                <div class="pr-4">
                    <@ambassify feed/>
                </div>
                <div>
                    <#list campaigns[0..1] as campaign>
                        <a target="_blank" href="${campaign.syndEntryLink}" style="color: var(--white); text-decoration: none !important">
                            ${campaign.syndEntry.title}

                            &nbsp;&nbsp;•&nbsp;&nbsp;

                            <nobr style="opacity: 0.7; font-size: 0.9em;">
                                <@liferay_ui["icon"]
                                icon="calendar"
                                label=false
                                markupView="lexicon"
                                message=""
                                /> ${dateUtil.getDate(campaign.syndEntry.publishedDate, "d MMM, yyyy", locale)}
                            </nobr>
                        </a>
                        <#if !campaign?is_last>
                            <hr/>
                        </#if>
                    </#list>
                </div>
            </div>
        </div>
    </#if>
</#if>

<#macro ambassify feed>
    <a target="_blank" href="${feed.syndFeedLink}">
        <img src="data:image/png;base64,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"/>
    </a>
</#macro>