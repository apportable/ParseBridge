package com.parsebridge;

import android.util.Log;
import com.apportable.utils.ThreadUtils;

public class GLThreadParseImageView extends com.parse.ParseImageView {

    private static String TAG = "GLThreadParseImageView";

    public GLThreadParseImageView(android.content.Context ctx) {
        super(ctx);
    }

    @Override
    public void setImageBitmap(final android.graphics.Bitmap bitmap) {

        ThreadUtils.runOnGlThread(new Runnable() {
            @Override
            public void run() {
                GLThreadParseImageView.super.setImageBitmap(bitmap);
            }
        });
    }

}