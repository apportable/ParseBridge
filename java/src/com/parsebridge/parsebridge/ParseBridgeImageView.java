package com.parsebridge;

import com.apportable.ui.View;
import com.apportable.activity.VerdeActivity;

import android.content.Context;
import android.graphics.RectF;
import android.util.Log;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;

import com.parse.ParseImageView;
import com.parse.ParseFile;
import com.parse.GetDataCallback;

public class ParseBridgeImageView extends View {
    private ParseImageView mImageView;
    private ParseFile mParseFile;
    private static String TAG = "ParseBridgeImageView";

    private void init() {
        mImageView = new GLThreadParseImageView(VerdeActivity.getActivity());
        this.addView(mImageView, this.getLayoutParams());
    }

    protected ParseBridgeImageView(Context ctx, int object) {
        super(ctx, object);
        init();
    }
    
    protected ParseBridgeImageView(Context ctx, int object, RectF frame) {
        super(ctx, object, frame);
        init();
    }

    public static ParseBridgeImageView create(final Context ctx, final int object) {
        return new ParseBridgeImageView(ctx, object);
    }
    
    public static ParseBridgeImageView create(final Context ctx, final int object, final RectF frame) {
        return new ParseBridgeImageView(ctx, object, frame);
    }

    public void loadInBackground() {
        if (mImageView != null) {
            mImageView.loadInBackground();
        }
    }

    public void loadInBackground(GetDataCallback completionCallback) {
        if (mImageView != null) {
            mImageView.loadInBackground(completionCallback);
        }
    }

    public void setParseFile(ParseFile file) {
        mParseFile = file;
        if (mImageView != null) {
            mImageView.setParseFile(file);
        }
    }

    public ParseFile getParseFile() {
        return mParseFile;
    }

    public void setPlaceholder(Bitmap bitmap) {
        if (mImageView != null) {
            if (bitmap == null) {
                mImageView.setPlaceholder(null);
            }
            else {
                BitmapDrawable drawable = new BitmapDrawable(bitmap);
                mImageView.setPlaceholder(drawable);
            }
        }
    }

}