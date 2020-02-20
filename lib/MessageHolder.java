public class MessageHolder extends RecyclerView.ViewHolder {
    TextView mText;
    TextView mUsername;
    TextView mTime;
    TextView mLikesCount;
    ImageView imgProfile, imgDropdown, imgLikes;
    public MessageHolder(View itemView) {
        super(itemView);
        mText = itemView.findViewById(R.id.message_text);
        mUsername = itemView.findViewById(R.id.message_user);
        mTime = itemView.findViewById(R.id.message_time);
        mLikesCount = itemView.findViewById(R.id.message_Likes);
        imgProfile = itemView.findViewById(R.id.imgDps);
        imgLikes = itemView.findViewById(R.id.imgLikes);
        imgDropdown = itemView.findViewById(R.id.imgDropdwon);
    }
}