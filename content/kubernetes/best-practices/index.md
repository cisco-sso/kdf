---
title: Best Practices
---

### Always Set Pod Memory/Cpu Limits and Requests

The kubernetes scheduler is responsible for scheduling pods across the cluster of worker machines.  The scheduler relies
on every pod having [mem/cpu limits](https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource)
set, so that it can calculate if a node is too full to schedule more pods on, or yet has enough spare capacity to assign
a particular pod.  If a pod has no mem/cpu limits set, then the pod is infinitesimally small according to the scheduler
and thus can fit on any worker node.  In addition, that pod is allowed to consume
[infinite](https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource/#if-you-don-t-specify-a-memory-limit)
resources, allowing the risk of out of memory issues on the worker node causing instability and having the Linux OOM
killer trigger and kill processes at random.

Guidlines for setting Pod Memory/Cpu Limits and Requests:

* Set memory and cpu limits and requests are set on every pod
* Set default memory and cpu limits on every namespace using
  [LimitRange](https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/memory-default-namespace/#create-a-limitrange-and-a-pod)
  * This allows pods without limits set to inherit a default setting.
  * Set it to something low such as 100m cpu and 256Mi memory
* Always set "memory request" == "memory limit"
  * This prevents oversubscription of memory on a node
  * Out of memory conditions on a node creates unpredictable behavior (i.e. Kernel OOM Killer)
* Setting "cpu request" != "cpu limit" is generally okay.
  * This allows cpu bursting, which is the nature of CPUs.
* For Java only:
  * Always set "-Xmx"
      * Java defaults to 25% of the available memory on the kube machines or 4GB depending on the size of machine.
  * Always set "-Xmx" and "-Xms", ensure they are the [same](https://developer.jboss.org/thread/149559)
  * Ensure "pod memory limit" is greater than "-Xmx" + "some headroom for OS caches and JVM (384MB)"


### Use Pod PriorityClasses

[Priority Classes](https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/#priorityclass) allow for
more important pods to preempt (evict) lower priority pods.  There are race conditions in the Kubernetes multi-replica
scheduler which sometimes cause nodes to be overbooked when they are first added to the cluster.  Using PriorityClasses
ensures that critical pods are always scheduled.

Example PriorityClass levels in priority order:

1. "kube-system" pods (e.g. Kubelet)
2. Monitoring and dashboards (e.g. Prometheus)
3. Data stores (e.g. postgres)
4. Application
