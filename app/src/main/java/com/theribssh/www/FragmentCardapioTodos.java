package com.theribssh.www;

import android.app.Activity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by biiac on 08/10/2017.
 */

public class FragmentCardapioTodos extends Fragment {

    private ListView list_view_cardapio_todos;
    private CardapioTodosAdapter cardapioTodosAdapter;
    List<CardapioTodosListView> card_todos;
    Activity act;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_cardapios_principais, container, false);

        list_view_cardapio_todos = (ListView) rootView.findViewById(R.id.list_view_cardapio_principais);

        act = ((MainActivity)getActivity());

        configurarListView();

        return rootView;


    }

    private void configurarListView() {

        card_todos = new ArrayList<>();

        new PegadorTask().execute();
    }

    private class PegadorTask extends AsyncTask<Void, Void, Void>
    {
        String json;
        @Override
        protected Void doInBackground(Void... voids) {
            String href = "http://10.0.2.2:8888/selectCardapio";
            json = HttpConnection.get(href);

            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            Gson gson = new Gson();

            card_todos = gson.fromJson(json, new TypeToken<List<CardapioTodosListView>>(){
            }.getType());

            cardapioTodosAdapter = new CardapioTodosAdapter(card_todos, act);
            try {
                list_view_cardapio_todos.setAdapter(cardapioTodosAdapter);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }
}
