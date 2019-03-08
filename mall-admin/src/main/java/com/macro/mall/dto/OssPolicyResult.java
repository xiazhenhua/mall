package com.macro.mall.dto;

/**
 * 获取OSS上传授权返回结果
 * Created by macro on 2018/5/17.
 */
public class OssPolicyResult {
    private String accessKeyId;
    private String policy;
    private String signature;
    private String dir;
    private String host;
    private String success_action_status;

    public String getAccessKeyId() {
        return accessKeyId;
    }

    public void setAccessKeyId(String accessKeyId) {
        this.accessKeyId = accessKeyId;
    }

    public String getPolicy() {
        return policy;
    }

    public void setPolicy(String policy) {
        this.policy = policy;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

	public String getSuccess_action_status() {
		return success_action_status;
	}

	public void setSuccess_action_status(String success_action_status) {
		this.success_action_status = success_action_status;
	}
    
}
