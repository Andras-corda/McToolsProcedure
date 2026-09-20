(new Object(){
    int pick(java.util.List<?> weights) {
        double total = 0;
        for (Object w : weights) if (w instanceof Number n) total += n.doubleValue();
        double r = Math.random() * total;
        double cumulative = 0;
        for (int i = 0; i < weights.size(); i++) {
            Object w = weights.get(i);
            cumulative += (w instanceof Number n) ? n.doubleValue() : 0;
            if (r < cumulative) return i;
        }
        return Math.max(0, weights.size() - 1);
    }
}.pick((java.util.List<?>) ${input$weights}))
