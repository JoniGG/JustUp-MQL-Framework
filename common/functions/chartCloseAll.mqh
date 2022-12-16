//--- Close all trading charts
#define _CHART_CLOSE_ALL_VERSION 1.0

void ChartCloseAll(bool closeCurrent, string skipWithComment = NULL)
{
      for(long ch=ChartFirst();ch >= 0;ch=ChartNext(ch))
                if(ch!=ChartID())
                {
                    if(skipWithComment == NULL)
                        ChartClose(ch);
                    else
                        if(ChartGetString(ch,CHART_COMMENT) != skipWithComment)
                            ChartClose(ch);
                }
      if(closeCurrent)
        ChartClose(ChartID());
}