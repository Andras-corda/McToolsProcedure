{
    long _benchStart = System.nanoTime();
    ${statement$body}
    long _benchMs = (System.nanoTime() - _benchStart) / 1000000;
    org.slf4j.LoggerFactory.getLogger("${modid}").info("[Benchmark] " + _benchMs + " ms");
}
