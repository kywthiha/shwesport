package com.shwesports.fragment;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.ViewPager;
import android.support.v4.widget.NestedScrollView;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import me.myatminsoe.mdetect.MMTextView;
import android.widget.Toast;

import com.bosphere.fadingedgelayout.FadingEdgeLayout;
import com.shwesports.adapter.HomeCategoryAdapter;
import com.shwesports.adapter.HomeChannelAdapter;
import com.shwesports.adapter.HomeMovieAdapter;
import com.shwesports.adapter.HomeRecentAdapter;
import com.shwesports.adapter.HomeSeriesAdapter;
import com.shwesports.adapter.SliderAdapter;
import com.shwesports.db.DatabaseHelper;
import com.shwesports.item.ItemCategory;
import com.shwesports.item.ItemChannel;
import com.shwesports.item.ItemMovie;
import com.shwesports.item.ItemRecent;
import com.shwesports.item.ItemSeries;
import com.shwesports.item.ItemSlider;
import com.shwesports.livetv.MainActivity;
import com.shwesports.livetv.MovieDetailsActivity;
import com.shwesports.livetv.R;
import com.shwesports.livetv.SeriesDetailsActivity;
import com.shwesports.livetv.TVDetailsActivity;
import com.shwesports.util.API;
import com.shwesports.util.BannerAds;
import com.shwesports.util.Constant;
import com.shwesports.util.IsRTL;
import com.shwesports.util.NetworkUtils;
import com.shwesports.util.RvOnClickListener;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import cz.msebera.android.httpclient.Header;
import me.relex.circleindicator.CircleIndicator;

public class HomeFragment extends Fragment {

    ProgressBar mProgressBar;
    LinearLayout lyt_not_found;
    NestedScrollView nestedScrollView;
    ViewPager viewPager;
    MMTextView  channelViewAll;
    //recyclers
    RecyclerView rvChannel;
    //lists
    ArrayList<ItemChannel> channelList;
    ArrayList<ItemSlider> sliderList;

    SliderAdapter sliderAdapter;
    HomeChannelAdapter channelAdapter;

    DatabaseHelper databaseHelper;
    CircleIndicator circleIndicator;
    LinearLayout  lytChannel;
    RelativeLayout lytSlider;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_home, container, false);

        FadingEdgeLayout feChannel = rootView.findViewById(R.id.feChannel);

        IsRTL.changeShadowInRtl(requireActivity(), feChannel);

        databaseHelper = new DatabaseHelper(getActivity());

        LinearLayout mAdViewLayout = rootView.findViewById(R.id.adView);
        BannerAds.ShowBannerAds(getActivity(), mAdViewLayout);

        channelList = new ArrayList<>();
        sliderList = new ArrayList<>();

        mProgressBar = rootView.findViewById(R.id.progressBar1);
        lyt_not_found = rootView.findViewById(R.id.lyt_not_found);
        nestedScrollView = rootView.findViewById(R.id.nestedScrollView);
        viewPager = rootView.findViewById(R.id.viewPager);
        circleIndicator = rootView.findViewById(R.id.indicator_unselected_background);


        channelViewAll = rootView.findViewById(R.id.textLatestChannelViewAll);
        lytSlider = rootView.findViewById(R.id.lytSlider);


        lytChannel = rootView.findViewById(R.id.lytHomeLatestChannel);
        rvChannel = rootView.findViewById(R.id.rv_latest_channel);


        rvChannel.setHasFixedSize(true);
        rvChannel.setLayoutManager(new LinearLayoutManager(getActivity(), LinearLayoutManager.HORIZONTAL, false));
        rvChannel.setFocusable(false);
        rvChannel.setNestedScrollingEnabled(false);

        if (NetworkUtils.isConnected(getActivity())) {
            getHome();
        } else {
            Toast.makeText(getActivity(), getString(R.string.conne_msg1), Toast.LENGTH_SHORT).show();
        }

        return rootView;
    }

    private void getHome() {
        AsyncHttpClient client = new AsyncHttpClient();
        RequestParams params = new RequestParams();
        JsonObject jsObj = (JsonObject) new Gson().toJsonTree(new API());
        jsObj.addProperty("method_name", "get_home");
        params.put("data", API.toBase64(jsObj.toString()));

        client.post(Constant.API_URL, params, new AsyncHttpResponseHandler() {
            @Override
            public void onStart() {
                super.onStart();
                mProgressBar.setVisibility(View.VISIBLE);
                nestedScrollView.setVisibility(View.GONE);
            }

            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                mProgressBar.setVisibility(View.GONE);
                nestedScrollView.setVisibility(View.VISIBLE);

                String result = new String(responseBody);
                try {
                    JSONObject mainJson = new JSONObject(result);
                    JSONObject liveTVJson = mainJson.getJSONObject(Constant.ARRAY_NAME);

                    JSONArray sliderArray = liveTVJson.getJSONArray("banner");
                    for (int i = 0; i < sliderArray.length(); i++) {
                        JSONObject jsonObject = sliderArray.getJSONObject(i);
                        ItemSlider itemSlider = new ItemSlider();
                        itemSlider.setId(jsonObject.getString("id"));
                        itemSlider.setSliderTitle(jsonObject.getString("title"));
                        itemSlider.setSliderSubTitle(jsonObject.getString("sub_title"));
                        itemSlider.setSliderImage(jsonObject.getString("slide_image"));
                        itemSlider.setSliderType(jsonObject.getString("type"));
                        sliderList.add(itemSlider);
                    }


                    JSONArray channelArray = liveTVJson.getJSONArray("latest_channels");
                    for (int i = 0; i < channelArray.length(); i++) {
                        JSONObject jsonObject = channelArray.getJSONObject(i);
                        ItemChannel itemChannel = new ItemChannel();
                        itemChannel.setId(jsonObject.getString(Constant.CHANNEL_ID));
                        itemChannel.setChannelName(jsonObject.getString(Constant.CHANNEL_TITLE));
                        itemChannel.setImage(jsonObject.getString(Constant.CHANNEL_IMAGE));
                        channelList.add(itemChannel);
                    }

                    displayData();

                } catch (JSONException e) {
                    e.printStackTrace();
                    nestedScrollView.setVisibility(View.GONE);
                    lyt_not_found.setVisibility(View.VISIBLE);
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
                mProgressBar.setVisibility(View.GONE);
                nestedScrollView.setVisibility(View.GONE);
                lyt_not_found.setVisibility(View.VISIBLE);
            }
        });
    }

    private void displayData() {
        if (!sliderList.isEmpty()) {
            sliderAdapter = new SliderAdapter(requireActivity(), sliderList);
            viewPager.setAdapter(sliderAdapter);
            circleIndicator.setViewPager(viewPager);
        } else {
            lytSlider.setVisibility(View.GONE);
        }

        if (!channelList.isEmpty()) {
            channelAdapter = new HomeChannelAdapter(getActivity(), channelList);
            rvChannel.setAdapter(channelAdapter);

            channelAdapter.setOnItemClickListener(new RvOnClickListener() {
                @Override
                public void onItemClick(int position) {
                    String tvId = channelList.get(position).getId();
                    Intent intent = new Intent(getActivity(), TVDetailsActivity.class);
                    intent.putExtra("Id", tvId);
                    startActivity(intent);
                }
            });
            
        } else {
            lytChannel.setVisibility(View.GONE);
        }


        channelViewAll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                changeFragment(new LatestChannelFragment(), getString(R.string.home_latest_channel));
            }
        });

    }

    private void changeFragment(Fragment fragment, String Name) {
        FragmentManager fm = getFragmentManager();
        assert fm != null;
        FragmentTransaction ft = fm.beginTransaction();
        ft.hide(HomeFragment.this);
        ft.add(R.id.Container, fragment, Name);
        ft.addToBackStack(Name);
        ft.commit();
        ((MainActivity) requireActivity()).setToolbarTitle(Name);
    }

    @Override
    public void onResume() {
        super.onResume();

    }
}
