package com.shwesports.item;

import me.myatminsoe.mdetect.MDetect;

public class ItemMovie {
    private String id;
    private String movieTitle;
    private String movieDesc;
    private String moviePoster;
    private String movieCover;
    private String totalViews;
    private String rateAvg;
    private String languageId;
    private String languageName;
    private String languageBackground;
    private String movieUrl;
    private String movieType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMovieTitle() {
        return MDetect.INSTANCE.getText(movieTitle);
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public String getMovieDesc() {
        return MDetect.INSTANCE.getText(movieDesc);
    }

    public void setMovieDesc(String movieDesc) {
        this.movieDesc = movieDesc;
    }

    public String getMoviePoster() {
        return MDetect.INSTANCE.getText(moviePoster);
    }

    public void setMoviePoster(String moviePoster) {
        this.moviePoster = moviePoster;
    }

    public String getMovieCover() {
        return movieCover;
    }

    public void setMovieCover(String movieCover) {
        this.movieCover = movieCover;
    }

    public String getTotalViews() {
        return totalViews;
    }

    public void setTotalViews(String totalViews) {
        this.totalViews = totalViews;
    }

    public String getRateAvg() {
        return rateAvg;
    }

    public void setRateAvg(String rateAvg) {
        this.rateAvg = rateAvg;
    }

    public String getLanguageName() {
        return MDetect.INSTANCE.getText(languageName);
    }

    public void setLanguageName(String languageName) {
        this.languageName = languageName;
    }

    public String getLanguageBackground() {
        return languageBackground;
    }

    public void setLanguageBackground(String languageBackground) {
        this.languageBackground = languageBackground;
    }

    public String getLanguageId() {
        return languageId;
    }

    public void setLanguageId(String languageId) {
        this.languageId = languageId;
    }

    public String getMovieUrl() {
        return movieUrl;
    }

    public void setMovieUrl(String movieUrl) {
        this.movieUrl = movieUrl;
    }

    public String getMovieType() {
        return MDetect.INSTANCE.getText(movieType);
    }

    public void setMovieType(String movieType) {
        this.movieType = movieType;
    }
}
