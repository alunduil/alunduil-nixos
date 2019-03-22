{ config, ... }:
{
  services.kubernetes = {
    apiserver = {
      admissionControl = [
        "LimitRanger"
        "NamespaceLifecycle"
        "ResourceQuota"
        "ServiceAccount"
      ];
      advertiseAddress = config.networking.hostName;
      authorizationMode = "ABAC";
    };

    kubelet = {
      clusterDomain = "kubernetes";
      enable = true;
    };
  };
}
