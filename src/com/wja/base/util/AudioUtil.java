package com.wja.base.util;

import java.io.File;

import it.sauronsoftware.jave.AudioAttributes;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.EncoderException;
import it.sauronsoftware.jave.EncodingAttributes;
import it.sauronsoftware.jave.InputFormatException;

public class AudioUtil
{
    public static void changeAmrToMp3(String sourcePath, String targetPath)
    {
        File source = new File(sourcePath);
        File target = new File(targetPath);
        AudioAttributes audio = new AudioAttributes();
        Encoder encoder = new Encoder();
        audio.setCodec("libmp3lame");
        EncodingAttributes attrs = new EncodingAttributes();
        attrs.setFormat("mp3");
        attrs.setAudioAttributes(audio);
        try
        {
            encoder.encode(source, target, attrs);
        }
        catch (IllegalArgumentException e)
        {
            e.printStackTrace();
        }
        catch (InputFormatException e)
        {
            e.printStackTrace();
        }
        catch (EncoderException e)
        {
            e.printStackTrace();
        }
    }
}
