package com.shwesports.fragment;


import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import me.myatminsoe.mdetect.MMTextView;

import com.shwesports.adapter.FavouriteMovieAdapter;
import com.shwesports.db.DatabaseHelper;
import com.shwesports.item.ItemMovie;
import com.shwesports.livetv.MovieDetailsActivity;
import com.shwesports.livetv.R;
import com.shwesports.util.RvOnClickListener;

import java.util.ArrayList;


public class FavoriteMovieFragment extends Fragment {

    ArrayList<ItemMovie> mListItem;
    public RecyclerView recyclerView;
    FavouriteMovieAdapter adapter;
    MMTextView textView;
    DatabaseHelper databaseHelper;

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_favourite, container, false);

        databaseHelper = new DatabaseHelper(getActivity());
        mListItem = new ArrayList<>();
        textView = rootView.findViewById(R.id.text_no);
        recyclerView = rootView.findViewById(R.id.recyclerView);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new GridLayoutManager(getActivity(), 3));

        return rootView;
    }

    @Override
    public void onResume() {
        super.onResume();
        mListItem = databaseHelper.getFavouriteMovie();
        displayData();
    }

    private void displayData() {

        adapter = new FavouriteMovieAdapter(getActivity(), mListItem);
        recyclerView.setAdapter(adapter);

        adapter.setOnItemClickListener(new RvOnClickListener() {
            @Override
            public void onItemClick(int position) {
                String movieId = mListItem.get(position).getId();
                Intent intent = new Intent(getActivity(), MovieDetailsActivity.class);
                intent.putExtra("Id", movieId);
                startActivity(intent);
            }
        });

        if (adapter.getItemCount() == 0) {
            textView.setVisibility(View.VISIBLE);
        } else {
            textView.setVisibility(View.GONE);
        }
    }
}
