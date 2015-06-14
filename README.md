# Streamliner

Lightweight solution to measure controller usage with the aim of
locating unused controllers.

To generate a report
```
rake streamliner:report
```

To reset usage statistics:
```
rake streamliner:reset
```

The current implementation will work only on Rails 4.

