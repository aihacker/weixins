package com.wja.weixin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wja.base.util.Log;
import com.wja.base.web.AppContext;
import com.wja.weixin.entity.UpFile;
import com.wja.weixin.service.CommBaseService;
import com.wja.weixin.service.UpFileService;

@Controller
public class UploadController
{
    private static String rootDir = AppContext.getSysParam("wx.upload.save.rootdir");
    
    public static final String FILE_BUSI_TYPE_AUTH = "auth";
    
    private static FileNameGer fileNameGer = new FileNameGer();
    
    @Autowired
    private CommBaseService cbs;
    
    @Autowired
    private UpFileService upFileService;
    
    @RequestMapping("/wx/web/upload/auth")
    @ResponseBody
    public Object authImageUpload(HttpSession session, @RequestPart("file") MultipartFile myfile)
    {
        String openId = (String)session.getAttribute("openId");
        if (this.cbs.checkOpenIdAuthOk(openId))
        {
            String path = "/auth/" + openId;
            File dir = new File(rootDir + path);
            if (!dir.exists())
            {
                if (!dir.mkdirs())
                {
                    return new Result(null, null, "创建存放目录失败！");
                }
            }
            String oriName = myfile.getOriginalFilename();
            String suffix = "";
            int index = oriName.lastIndexOf('.');
            if (index != -1)
            {
                suffix = oriName.substring(index);
            }
            String fileName = fileNameGer.getMillisFileName() + suffix;
            try
            {
                myfile.transferTo(new File(dir, fileName));
                UpFile uf = new UpFile(path + "/" + fileName, FILE_BUSI_TYPE_AUTH);
                uf = this.upFileService.save(uf);
                return new Result(uf.getId(), null, null);
            }
            catch (IllegalStateException | IOException e)
            {
                Log.LOGGER.error("上传认证图片保存失败", e);
                return new Result(null, null, "上传文件保存失败：" + e);
            }
        }
        else
        {
            return new Result(null, null, "没有openId,不可上传文件！");
        }
    }
    
    private void responseFile(File file, HttpServletResponse response)
    {
        if (file.exists())
        {
            String mimeType = URLConnection.guessContentTypeFromName(file.getName());
            if (mimeType != null)
            {
                response.setContentType(mimeType);
            }
            try (InputStream in = new FileInputStream(file); OutputStream os = response.getOutputStream();)
            {
                byte[] bf = new byte[1024 * 8];
                int count = 0;
                while ((count = in.read(bf)) != -1)
                {
                    os.write(bf, 0, count);
                    os.flush();
                }
            }
            catch (Exception e)
            {
                Log.LOGGER.error("文件获取，读取文件异常", e);
            }
        }
    }
    
    @RequestMapping("/wx/web/upload/get/{id}")
    public void getById(@PathVariable("id") String id, HttpServletResponse response)
    {
        if (StringUtils.isNotBlank(id))
        {
            UpFile uf = this.upFileService.get(UpFile.class, id);
            if (uf != null)
            {
                File file = new File(rootDir + uf.getFileName());
                
                this.responseFile(file, response);
            }
        }
        
    }
    
    @RequestMapping(value = {"/admin/upload/comm/multi"})
    @ResponseBody
    public Object commMultUpload(HttpSession session, @RequestPart("file") MultipartFile[] files, String type)
    {
        List<Result> list = new ArrayList<>();
        if (files.length > 0)
        {
            String ppath = "/" + (StringUtils.isBlank(type) ? "comm" : type);
            for (MultipartFile myfile : files)
            {
                String[] pns = fileNameGer.getDateDirMillisFileName();
                String path = ppath + "/" + pns[0];
                File dir = new File(rootDir + path);
                String oriName = myfile.getOriginalFilename();
                
                if (!dir.exists())
                {
                    if (!dir.mkdirs())
                    {
                        list.add(new Result(oriName, null, "创建存放目录失败！"));
                        continue;
                    }
                }
                
                String suffix = "";
                int index = oriName.lastIndexOf('.');
                if (index != -1)
                {
                    suffix = oriName.substring(index);
                }
                String fileName = pns[1] + suffix;
                try
                {
                    myfile.transferTo(new File(dir, fileName));
                    list.add(new Result(path + "/" + fileName,
                        AppContext.getSysParam("wx.download.public.url") + path + "/" + fileName, null));
                }
                catch (IllegalStateException | IOException e)
                {
                    Log.LOGGER.error("上传文件保存失败", e);
                    list.add(new Result(oriName, null, "上传文件保存失败：" + e));
                }
            }
        }
        return list;
    }
    
    @RequestMapping(value = {"/wx/web/upload/comm", "/admin/upload/comm"})
    @ResponseBody
    public Object commUpload(HttpSession session, @RequestPart("file") MultipartFile myfile, String type)
    {
        String openId = (String)session.getAttribute("openId");
        if (this.cbs.checkOpenIdAuthOk(openId))
        {
            String[] pns = fileNameGer.getDateDirMillisFileName();
            String path = "/" + (StringUtils.isBlank(type) ? "comm" : type) + "/" + pns[0];
            File dir = new File(rootDir + path);
            if (!dir.exists())
            {
                if (!dir.mkdirs())
                {
                    return new Result(null, null, "创建存放目录失败！");
                }
            }
            
            String oriName = myfile.getOriginalFilename();
            String suffix = "";
            int index = oriName.lastIndexOf('.');
            if (index != -1)
            {
                suffix = oriName.substring(index);
            }
            String fileName = pns[1] + suffix;
            try
            {
                myfile.transferTo(new File(dir, fileName));
                return new Result(path + "/" + fileName,
                    AppContext.getSysParam("wx.download.public.url") + path + "/" + fileName, null);
            }
            catch (IllegalStateException | IOException e)
            {
                Log.LOGGER.error("上传文件保存失败", e);
                return new Result(null, null, "上传文件保存失败：" + e);
            }
        }
        else
        {
            return new Result(null, null, "没有openId,不可上传文件！");
        }
    }
    
    private static class Result
    {
        private String link;
        
        private String fileName;
        
        private String errMsg;
        
        public Result(String fileName, String link, String errMsg)
        {
            this.fileName = fileName;
            this.link = link;
            this.errMsg = errMsg;
        }
        
        public String getLink()
        {
            return link;
        }
        
        public void setLink(String link)
        {
            this.link = link;
        }
        
        public String getFileName()
        {
            return fileName;
        }
        
        public void setFileName(String fileName)
        {
            this.fileName = fileName;
        }
        
        public String getErrMsg()
        {
            return errMsg;
        }
        
        public void setErrMsg(String errMsg)
        {
            this.errMsg = errMsg;
        }
        
    }
    
    private static class FileNameGer
    {
        private Calendar ca = Calendar.getInstance();
        
        private int seqNo = 0;
        
        synchronized String getMillisFileName()
        {
            ge();
            return ca.getTimeInMillis() + "-" + seqNo;
        }
        
        private void ge()
        {
            long ctm = System.currentTimeMillis();
            if (ctm == ca.getTimeInMillis())
            {
                seqNo++;
            }
            else
            {
                seqNo = 0;
                ca.setTimeInMillis(ctm);
            }
        }
        
        synchronized String[] getDateDirMillisFileName()
        {
            ge();
            int y = ca.get(Calendar.YEAR);
            int m = ca.get(Calendar.MONTH) + 1;
            int d = ca.get(Calendar.DAY_OF_MONTH);
            
            return new String[] {y + "/" + (m > 9 ? m : "0" + m) + "/" + (d > 9 ? d : "0" + d),
                ca.getTimeInMillis() + "-" + seqNo};
        }
    }
    
}
