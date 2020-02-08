package com.shwesports.livetv;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.design.widget.NavigationView;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.SearchView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.LinearLayout;

import me.myatminsoe.mdetect.MDetect;
import me.myatminsoe.mdetect.MMTextView;
import android.widget.Toast;
import com.shwesports.fragment.ChannelFragment;
import com.shwesports.fragment.FavouriteTabFragment;
import com.shwesports.fragment.GenreFragment;
import com.shwesports.fragment.HighLightCategoryFragment;
import com.shwesports.fragment.HomeFragment;
import com.shwesports.fragment.MovieTabFragment;
import com.shwesports.fragment.SeriesFragment;
import com.shwesports.fragment.SettingFragment;
import com.shwesports.util.BannerAds;
import com.shwesports.util.Constant;
import com.shwesports.util.IsRTL;
import com.ixidev.gdpr.GDPRChecker;
import com.shwesports.util.LocaleManager;

import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;

public class MainActivity extends BaseActivity {

    private DrawerLayout drawerLayout;
    NavigationView navigationView;
    BottomNavigationView bottomNavigationView;
    Toolbar toolbar;
    private FragmentManager fragmentManager;
    boolean doubleBackToExitPressedOnce = false;
    MyApplication myApplication;

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(CalligraphyContextWrapper.wrap(newBase));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        IsRTL.ifSupported(this);
        toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        navigationView = findViewById(R.id.navigation_view);
        bottomNavigationView =(BottomNavigationView)findViewById(R.id.btn_nav);
        drawerLayout = findViewById(R.id.drawer_layout);
        fragmentManager = getSupportFragmentManager();
        myApplication = MyApplication.getInstance();

        new GDPRChecker()
                .withContext(MainActivity.this)
                .withPrivacyUrl(getString(R.string.privacy_url)) // your privacy url
                .withPublisherIds(Constant.adMobPublisherId) // your admob account Publisher id
                .withTestMode("9424DF76F06983D1392E609FC074596C") // remove this on real project
                .check();

        LinearLayout mAdViewLayout = findViewById(R.id.adView);
        BannerAds.ShowBannerAds(this, mAdViewLayout);

        HomeFragment homeFragment = new HomeFragment();
        loadFrag(homeFragment, getString(R.string.menu_home), fragmentManager);
        setMMMenuText();

        navigationView.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                drawerLayout.closeDrawers();
                switch (menuItem.getItemId()) {
                    case R.id.menu_go_home:
                        HomeFragment homeFragment = new HomeFragment();
                        loadFrag(homeFragment, getString(R.string.menu_home), fragmentManager);
                        return true;
                    case R.id.menu_go_movie:
                        GenreFragment movieTabFragment = new GenreFragment();
                        loadFrag(movieTabFragment, getString(R.string.menu_live), fragmentManager);
                        return true;
                    case R.id.menu_go_tv_series:
                        SeriesFragment seriesFragment = new SeriesFragment();
                        loadFrag(seriesFragment, getString(R.string.menu_highlight), fragmentManager);
                        return true;
                    case R.id.menu_go_tv_channel:
                      /*  CategoryFragment categoryFragment = new CategoryFragment();*/
                        Bundle bundle = new Bundle();
                        bundle.putString("Id", "3");
                        ChannelFragment channelFragment = new ChannelFragment();
                        channelFragment.setArguments(bundle);
                        loadFrag(channelFragment, getString(R.string.menu_channel), fragmentManager);
                        return true;
                    case R.id.menu_go_favourite:
                        FavouriteTabFragment favouriteTabFragment = new FavouriteTabFragment();
                        loadFrag(favouriteTabFragment, getString(R.string.menu_favourite), fragmentManager);
                        return true;
                    case R.id.menu_go_profile:
                        Intent intentProfile = new Intent(MainActivity.this, ProfileActivity.class);
                        startActivity(intentProfile);
                        return true;
                    case R.id.menu_go_setting:
                        SettingFragment settingFragment = new SettingFragment();
                        loadFrag(settingFragment, getString(R.string.menu_setting), fragmentManager);
                        return true;
                    case R.id.menu_go_logout:
                        logOut();
                        return true;
                    case R.id.menu_go_log_in:
                        Intent intent = new Intent(getApplicationContext(), SignInActivity.class);
                        intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                        startActivity(intent);
                        finish();
                        return true;
                    default:
                        return true;
                }
            }
        });

        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()){
                    case R.id.menu_nav_home:
                        HomeFragment homeFragment = new HomeFragment();
                        loadFrag(homeFragment, getString(R.string.menu_home), fragmentManager);
                        return true;
                    case R.id.menu_nav_live:
                        GenreFragment movieTabFragment = new GenreFragment();
                        loadFrag(movieTabFragment, getString(R.string.menu_live), fragmentManager);
                        return true;
                    case R.id.menu_nav_highlight:
                        HighLightCategoryFragment highLightCategoryFragment = new HighLightCategoryFragment();
                        loadFrag(highLightCategoryFragment, getString(R.string.menu_highlight), fragmentManager);
                        return true;
                    case R.id.menu_nav_channel:
                        Bundle bundle = new Bundle();
                        bundle.putString("Id", "3");
                        ChannelFragment channelFragment = new ChannelFragment();
                        channelFragment.setArguments(bundle);
                        loadFrag(channelFragment, getString(R.string.menu_channel), fragmentManager);
                        return true;
                }
                return true;
            }
        });

        ActionBarDrawerToggle actionBarDrawerToggle = new ActionBarDrawerToggle(this, drawerLayout, toolbar, R.string.drawer_open, R.string.drawer_close) {
            @Override
            public void onDrawerClosed(View drawerView) {
                super.onDrawerClosed(drawerView);
            }

            @Override
            public void onDrawerOpened(View drawerView) {
                super.onDrawerOpened(drawerView);
            }
        };

        drawerLayout.addDrawerListener(actionBarDrawerToggle);
        actionBarDrawerToggle.syncState();
        toolbar.setNavigationIcon(R.drawable.ic_side_nav);

    }

    public void loadFrag(Fragment f1, String name, FragmentManager fm) {
        for (int i = 0; i < fm.getBackStackEntryCount(); ++i) {
            fm.popBackStack();
        }
        FragmentTransaction ft = fm.beginTransaction();
        ft.replace(R.id.Container, f1, name);
        ft.commit();
        setToolbarTitle(name);
    }

    public void setToolbarTitle(String Title) {
        if (getSupportActionBar() != null) {
            getSupportActionBar().setTitle(MDetect.INSTANCE.getText(Title));
        }
    }

    public void setHeader() {
        if (myApplication.getIsLogin() && navigationView != null) {
            View header = navigationView.getHeaderView(0);
            MMTextView txtHeaderName = header.findViewById(R.id.nav_name);
            MMTextView txtHeaderEmail = header.findViewById(R.id.nav_email);

            txtHeaderName.setText(myApplication.getUserName());
            txtHeaderEmail.setText(myApplication.getUserEmail());
        }
        if (myApplication.getIsLogin()) {
            navigationView.getMenu().findItem(R.id.menu_go_log_in).setVisible(false);
            navigationView.getMenu().findItem(R.id.menu_go_profile).setVisible(true);
            navigationView.getMenu().findItem(R.id.menu_go_logout).setVisible(true);
        } else {
            navigationView.getMenu().findItem(R.id.menu_go_log_in).setVisible(true);
            navigationView.getMenu().findItem(R.id.menu_go_profile).setVisible(false);
            navigationView.getMenu().findItem(R.id.menu_go_logout).setVisible(false);
        }
    }

    private void setMMMenuText(){
        bottomNavigationView.getMenu().findItem(R.id.menu_nav_home).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_home)));
        bottomNavigationView.getMenu().findItem(R.id.menu_nav_live).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_live)));
        bottomNavigationView.getMenu().findItem(R.id.menu_nav_highlight).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_highlight)));
        bottomNavigationView.getMenu().findItem(R.id.menu_nav_channel).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_channel)));
        navigationView.getMenu().findItem(R.id.menu_go_home).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_home)));
        navigationView.getMenu().findItem(R.id.menu_go_tv_channel).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_channel)));
        navigationView.getMenu().findItem(R.id.menu_go_tv_series).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_highlight)));
        navigationView.getMenu().findItem(R.id.menu_go_movie).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_live)));
        navigationView.getMenu().findItem(R.id.menu_go_profile).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_profile)));
        navigationView.getMenu().findItem(R.id.menu_go_setting).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_setting)));
        navigationView.getMenu().findItem(R.id.menu_go_log_in).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_log_in)));
        navigationView.getMenu().findItem(R.id.menu_go_logout).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_log_out)));
        navigationView.getMenu().findItem(R.id.menu_go_favourite).setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_favourite)));
    }

    private void logOut() {
        new AlertDialog.Builder(MainActivity.this)
                .setTitle(MDetect.INSTANCE.getText(getString(R.string.menu_log_out)))
                .setMessage(MDetect.INSTANCE.getText(getString(R.string.logout_msg)))
                .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        myApplication.saveIsLogin(false);
                        Intent intent = new Intent(getApplicationContext(), SignInActivity.class);
                        intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                        startActivity(intent);
                        finish();
                    }
                })
                .setNegativeButton(android.R.string.no, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        // do nothing
                    }
                })
                .setIcon(R.drawable.ic_logout)
                .show();
    }

    @Override
    protected void onResume() {
        super.onResume();
        setHeader();
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        if (item.getItemId() == R.id.lan_change){
            String cur_lang = LocaleManager.getLocale(getResources()).toString();
            if (cur_lang.equals("my")){
                setNewLocale(this, LocaleManager.ENGLISH);
            }
            else
                setNewLocale(this, LocaleManager.MYANMAR);


            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    private void setNewLocale(BaseActivity mContext, @LocaleManager.LocaleDef String language) {
        LocaleManager.setNewLocale(this, language);
        Intent intent = mContext.getIntent();
        startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK));

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_search, menu);
        final MenuItem searchMenuItem = menu.findItem(R.id.search);
        final SearchView searchView = (SearchView) searchMenuItem.getActionView();
        String cur_lang = LocaleManager.getLocale(getResources()).toString();
        if (cur_lang.equals("en"))
        {
            int drawableResourceId = getResources().getIdentifier("my", "drawable", getPackageName());
            menu.findItem(R.id.lan_change).setIcon(drawableResourceId);
//            Toast.makeText(this,drawableResourceId +"",Toast.LENGTH_SHORT).show();
        }
        else{
            int drawableResourceId = getResources().getIdentifier("en", "drawable", getPackageName());
            menu.findItem(R.id.lan_change).setIcon(drawableResourceId);
        }

        searchView.setOnQueryTextFocusChangeListener(new View.OnFocusChangeListener() {

            @Override
            public void onFocusChange(View v, boolean hasFocus) {
                // TODO Auto-generated method stub
                if (!hasFocus) {
                    searchMenuItem.collapseActionView();
                    searchView.setQuery("", false);
                }
            }
        });

        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {

            @Override
            public boolean onQueryTextSubmit(String arg0) {
                // TODO Auto-generated method stub
                Intent intent = new Intent(MainActivity.this, SearchHorizontalActivity.class);
                intent.putExtra("search", arg0);
                startActivity(intent);
                searchView.clearFocus();
                return false;
            }

            @Override
            public boolean onQueryTextChange(String arg0) {
                // TODO Auto-generated method stub
                return false;
            }
        });

        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public void onBackPressed() {
        if (drawerLayout.isDrawerOpen(GravityCompat.START)) {
            drawerLayout.closeDrawer(GravityCompat.START);
        } else if (fragmentManager.getBackStackEntryCount() != 0) {
            String tag = fragmentManager.getFragments().get(fragmentManager.getBackStackEntryCount() - 1).getTag();
            setToolbarTitle(tag);
            super.onBackPressed();
        } else {
            if (doubleBackToExitPressedOnce) {
                super.onBackPressed();
                return;
            }

            this.doubleBackToExitPressedOnce = true;
            Toast.makeText(this, getString(R.string.back_key), Toast.LENGTH_SHORT).show();

            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    doubleBackToExitPressedOnce = false;
                }
            }, 2000);
        }
    }
}
