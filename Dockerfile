FROM odoo:18.0

USER root
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     some-extra-package \
#     && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /mnt/extra-addons && chown -R odoo:odoo /mnt/extra-addons
COPY ./configurations/dev/config/odoo.conf /etc/odoo
COPY ./addons /mnt/extra-addons

RUN chown -R odoo:odoo /mnt/extra-addons

# Switch to the odoo user
USER odoo

# Expose Odoo service port
EXPOSE 8069

# Define entrypoint
ENTRYPOINT ["odoo", "-c", "/etc/odoo/odoo.conf"]
