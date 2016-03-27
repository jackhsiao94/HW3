---
  title: "NBA 2014-2015球季 各隊分析"
output: github_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```



## 安裝packages
```{r cars}
#install.packages("SportsAnalytics")
library(SportsAnalytics)
NBA1415<-fetch_NBAPlayerStatistics("14-15")
```
## 各隊最辛苦球員
計算依據所有人的出戰分鐘數

```{r echo=F}
maxminu<-NULL
for(team in unique(NBA1415$Team)){
  selectTeam<-subset(NBA1415,Team==team)
  maxminu<-rbind(maxminu,
                 selectTeam[
                   order(selectTeam$TotalMinutesPlayed,decreasing = T)[1],
                   c("Name","Team","TotalMinutesPlayed")])
}
maxminu2<-NULL
for(a in order(maxminu$TotalMinutesPlayed,decreasing = T)){
  maxminu2<-rbind(maxminu2,
                  maxminu[a,c("Name","Team","TotalMinutesPlayed")])
}
library(knitr)
kable(maxminu2,digits=2)
```


## 各隊得分王
計算依據所有人的得分數

```{r  echo=F}
maxpoint<-NULL
for(team in unique(NBA1415$Team)){
  selectTeam<-subset(NBA1415,Team==team)
  maxpoint<-rbind(maxpoint,
                  selectTeam[
                    order(selectTeam$TotalPoints,decreasing = T)[1],
                    c("Name","Team","TotalPoints")])
}
maxpoint2<-NULL
for(a in order(maxpoint$TotalPoints,decreasing = T)){
  maxpoint2<-rbind(maxpoint2,
                   maxpoint[a,c("Name","Team","TotalPoints")])
}
library(knitr)
kable(maxpoint2,digits=2)
```


## 最效率

```{r  echo=F}
eff<-NULL
for(team in unique(NBA1415$Team)){
  
  selectTeam<-subset(NBA1415,Team==team)
  selectTeam$TotalMinutesPlayed=selectTeam$TotalPoints/selectTeam$TotalMinutesPlayed
  
  eff<-rbind(eff,
             selectTeam[
               order(selectTeam$TotalMinutesPlayed,decreasing = T)[1],
               c("Team","Name","TotalMinutesPlayed")])
}

eff2<-NULL
for(a in order(eff$TotalMinutesPlayed,decreasing = T)){
  eff2<-rbind(eff2,
              eff[a,c("Name","Team","TotalMinutesPlayed")])
}
library(knitr)
kable(eff2,digits=2)
```

## 三分王

```{r  echo=F}

TRI<-NULL
for(team in unique(NBA1415$Team)){
  
  selectTeam<-subset(NBA1415,Team==team)
  selectTeam$ThreesMade=selectTeam$ThreesMade/selectTeam$ThreesAttempted
  
  TRI<-rbind(TRI,
             selectTeam[
               order(selectTeam$ThreesMade,decreasing = T)[1],
               c("Team","Name","ThreesMade")])
}

TRI2<-NULL
for(a in order(TRI$ThreesMade,decreasing = T)){
  TRI2<-rbind(TRI2,
              TRI[a,c("Name","Team","ThreesMade")])
}
library(knitr)
kable(TRI2,digits=2)
```


