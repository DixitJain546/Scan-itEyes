package org.tensorflow.lite.examples.classification;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;



import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.HashMap;

import butterknife.BindView;
import butterknife.ButterKnife;

public class DetailAdapter extends RecyclerView.Adapter<DetailAdapter.DetailViewHolder> {
    Activity activity;
    ArrayList<HashMap<String,String>> dataMap;
    public DetailAdapter(Activity activity,ArrayList<HashMap<String,String>> map)
    {
        this.activity=activity;
        this.dataMap=map;
    }
    @NonNull
    @Override
    public DetailViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view=activity.getLayoutInflater().inflate(R.layout.row_material,parent,false);
        DetailViewHolder detailViewHolder=new DetailViewHolder(view);


        return detailViewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull DetailViewHolder holder, int position) {
        HashMap<String,String> hashMap=dataMap.get(position);
        holder.tvMaterialName.setText(hashMap.get("M_Name"));
        holder.tvTenure.setText(hashMap.get("Survival"));
        String material=hashMap.get("M_Name");
        if(material.equals("Metal"))
            holder.cardMaterial.setBackgroundResource(R.drawable.metal);
        else if(material.equals("Stainless Steel"))
            holder.cardMaterial.setBackgroundResource(R.drawable.steel);
        else if(material.equals("Aluminium"))
            holder.cardMaterial.setBackgroundResource(R.drawable.aluminium);
        else if(material.equals("Wood"))
            holder.cardMaterial.setBackgroundResource(R.drawable.wood);
        else if(material.equals("Paper"))
            holder.cardMaterial.setBackgroundResource(R.drawable.paper);
        else if(material.equals("Copper"))
            holder.cardMaterial.setBackgroundResource(R.drawable.copper);
        else if(material.equals("Money"))
            holder.cardMaterial.setBackgroundResource(R.drawable.money);
        else if(material.equals("Plastics"))
            holder.cardMaterial.setBackgroundResource(R.drawable.plastic);
        else if(material.equals("Glass"))
            holder.cardMaterial.setBackgroundResource(R.drawable.glass);
        else
            holder.cardMaterial.setBackgroundResource(R.drawable.cardboard);
        Intent intent=new Intent(activity,MaterialActivity.class);
        intent.putExtra("MaterialName",holder.tvMaterialName.getText().toString());
        holder.cardMaterial.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                activity.startActivity(intent);
            }
        });
    }

    @Override
    public int getItemCount() {
        return dataMap.size();
    }

    public class DetailViewHolder extends RecyclerView.ViewHolder{
        @BindView(R.id.tvMaterialName)
        TextView tvMaterialName;
        @BindView(R.id.tvTenure)
        TextView tvTenure;
        @BindView(R.id.cardMaterial)
        LinearLayout cardMaterial;
        public DetailViewHolder(@NonNull View itemView) {
            super(itemView);
            ButterKnife.bind(this,itemView);

        }
    }
}
